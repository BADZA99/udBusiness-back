<?php

namespace App\Http\Controllers;

use App\Models\Profile;
use Illuminate\Http\Request;

class profileController extends Controller
{
    //cree la fonction qui va recuperer tous les profiles de la base de donnee
    public function allProfiles(){
        //recuperer tous les profiles
        $Allprofiles = Profile::all();
        //retourner les profiles
        return response()->json($Allprofiles);
    }
}
