<?php

namespace App\Http\Controllers;

use App\Models\Demandes;
use App\Models\User;
use App\Notifications\DemandeCreatedSuccess;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class DemandeController extends Controller
{
    //cree la fonction qui cree une demande
    public function createDemande(Request $request)
    {
        // $date = Carbon::createFromFormat('d-m-Y', $request->date_limite)->format('Y-m-d');
        if ($request->hasFile('photo')) {
            $photo = $request->file('photo');
            $extension = $photo->getClientOriginalExtension();
            $photoName = time() . '.' . $extension;
            $photo->move('images_demandes', $photoName);
        } else {
            $photoName = null;
        }
        $demande = Demandes::create([
            'user_id' => $request->user_id,
            'statut' => 1,
            'titre' => $request->titre,
            'description' => $request->description,
            'date_limite' => $request->date_limite,
            'categorie_id' => $request->categorie_id,
            'nomDemandeur' => $request->nomDemandeur,
            'photo' => $photoName,
            'contact' => $request->contact,
        ]);
        if($demande){
            // trouver le user qui a fait la demande
            $user = User::find($request->user_id);
            // envoyer une notification au user
            $user->notify(new DemandeCreatedSuccess($user->name, $user->prenom, $demande->titre));
            return response()->json(['message' => 'Demande created successfully', 'demande' => $demande], Response::HTTP_CREATED);
        }else{
            return response()->json(['message' => 'Demande not created'], Response::HTTP_BAD_REQUEST);
        
        }
  
    }

    // lister les demandes
    public function allDemandes()
    {
        $demandes = Demandes::all();
        return response()->json(['demandes' => $demandes], Response::HTTP_OK);
    }

    // les demandes d'un user
    public function userDemandes($id)
    {
        $demandes = Demandes::where('user_id', $id)->get();
        return response()->json(['demandes' => $demandes], Response::HTTP_OK);
    }

    // les demandes d'une categorie
    public function categorieDemandes($id)
    {
        $demandes = Demandes::where('categorie_id', $id)->get();
        return response()->json(['demandes' => $demandes], Response::HTTP_OK);
    }

    // supprimer une demande 
    public function deleteDemande($id)
    {
        $demande = Demandes::find($id);
        if (!$demande) {
            return response()->json(['message' => 'Demande not found'], Response::HTTP_NOT_FOUND);
        }
        $demande->delete();
        return response()->json(['message' => 'Demande deleted successfully'], Response::HTTP_OK);
    }

    // modifier une demande
    public function updateDemande(Request $request, $id)
    {
        $demande = Demandes::find($id);
        if (!$demande) {
            return response()->json(['message' => 'Demande not found'], Response::HTTP_NOT_FOUND);
        }
        $demande->update([
            'titre' => $request->titre,
            'description' => $request->description,
            'date_limite' => $request->date_limite,
            'categorie_id' => $request->categorie_id,
            'nomDemandeur' => $request->nomDemandeur,
            'photo' => $request->photo,
        ]);
        return response()->json(['message' => 'Demande updated successfully', 'demande' => $demande], Response::HTTP_OK);
    }
}
