<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class UserController extends Controller
{
    //crre une fonction qui va update les infos du user
    public function updateUser(Request $request, $id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(['message' => 'User not found'], Response::HTTP_NOT_FOUND);
        }
        if ($request->hasFile('cv')) {
            $cv = $request->file('cv');
            $extension = $cv->getClientOriginalExtension();
            $cvName = time() . '.' . $extension;
            $cv->move('AllCv', $cvName);
        } else {
            $cvName = null;
        }
        $user->update([
            'name' => $request->name,
            'adresse' => $request->adresse,
            'tarif' => $request->tarif,
            'cv' => $cvName,
            'telephone' => $request->telephone,
            // 'solde' => $request->solde,
        ]);
        return response()->json(['message' => 'User updated successfully', 'user' => $user], Response::HTTP_OK);
       
    }
}
