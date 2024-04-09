<?php

namespace App\Http\Controllers;

use App\Models\Demandes;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class DemandeController extends Controller
{
    //cree la fonction qui cree une demande
    public function createDemande(Request $request)
    {
        $date = Carbon::createFromFormat('d-m-Y', $request->date_limite)->format('Y-m-d');
        $demande = Demandes::create([
            'user_id' => $request->user_id,
            'statut' => 1,
            'titre' => $request->titre,
            'description' => $request->description,
            'date_limite' => $date,
            'categorie_id' => $request->categorie_id,
            'photo' => $request->photo,
        ]);
        return response()->json(['message' => 'Demande created successfully', 'demande' => $demande], Response::HTTP_CREATED);
    }
}
