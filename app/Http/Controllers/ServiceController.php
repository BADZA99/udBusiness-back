<?php

namespace App\Http\Controllers;

use App\Models\Services;
use App\Models\User;
use App\Notifications\ServiceCreatedSuccess;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ServiceController extends Controller
{
    //fonction qui cree un service 
    public function createService(Request $request)
    {

        if ($request->hasFile('photo')) {
            $photo = $request->file('photo');
            $extension = $photo->getClientOriginalExtension();
            $photoName = time() . '.' . $extension; 
            $photo->move('images_services', $photoName);
        } else {
            $photoName = null; 
        }

        $service = Services::create([
            'titre' => $request->titre,
            'description' => $request->description,
            'tarif' => $request->tarif,
            'date' => $request->date,
            'lieu' => $request->lieu,
            'user_id' => $request->user_id,
            'statut' => 1,
            'categorie_id' => $request->categorie_id,
            'photo' => $photoName, // Now $photoName will have the correct value
            'nomPrestataire' => $request->nomPrestataire,
            'telephonePresta' => $request->telephonePresta,
        ]);



        if (!$service) {
            return response()->json(['message' => 'Service not created'], Response::HTTP_BAD_REQUEST);
        }else{
            // trouver le user qui a publie le service
            $user = User::find($request->user_id);
            // envoyer une notification au user
            $user->notify(new ServiceCreatedSuccess($user->name, $user->prenom, $service->titre));
            return response()->json(['message' => 'Service created'],Response::HTTP_CREATED);
        }
    }

    // lister les services
    public function allServices()
    {
        $services = Services::all();
        return response()->json(['services' => $services], Response::HTTP_OK);
    }

    // les services d'un user
    public function userServices($id)
    {
        $services = Services::where('user_id', $id)->get();
        return response()->json(['services' => $services], Response::HTTP_OK);
    }

    //afficher un service en fonction
    public function showService($id)
    {
        $service = Services::find($id);
        if (!$service) {
            return response()->json(['message' => 'Service not found'], Response::HTTP_NOT_FOUND);
        }
        return response()->json(['service' => $service], Response::HTTP_OK);
    }

    // deleteService
    public function deleteService($id)
    {
        $service = Services::find($id);
        if (!$service) {
            return response()->json(['message' => 'Service not found'], Response::HTTP_NOT_FOUND);
        }
        $service->delete();
        return response()->json(['message' => 'Service deleted'], Response::HTTP_OK);
    }

    // updateService
    public function updateService(Request $request, $id)
    {
        $service = Services::find($id);
        if (!$service) {
            return response()->json(['message' => 'Service not found'], Response::HTTP_NOT_FOUND);
        }
        $service->update([
            'titre' => $request->titre,
            'description' => $request->description,
            'tarif' => $request->tarif,
            'date' => $request->date,
            'lieu' => $request->lieu,
            'user_id' => $request->user_id,
            'statut' => 1, 
            'categorie_id' => $request->categorie_id,
            'nomPrestataire' => $request->nomPrestataire,
            'telephonePresta' => $request->telephonePresta,
        ]);
        return response()->json(['message' => 'Service updated'], Response::HTTP_OK);
    }


}
