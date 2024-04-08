<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegisterRequest;
use App\Models\User;
use App\Notifications\InscriptionReussiNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response;

class AuthController extends Controller
{
    public function Register(RegisterRequest $request)
    {
        $existingUserEmail = User::where('email', $request->email)->first();
        // verifier le telephone
        $existingUsertel = User::where('telephone', $request->telephone)->first();



        if ($existingUserEmail) {
            return response()->json(['message' => 'Email already enregistred'], Response::HTTP_CONFLICT);
        }
        if ($existingUsertel) {
            return response()->json(['message' => 'telephone already enregistred'], Response::HTTP_CONFLICT);
        }

        $user =User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'role_id' => 2,
            'adresse' => $request->adresse,
            'telephone' => $request->telephone,
            'idProfile' => $request->idProfile,
            'sexe' => $request->sexe,
        ]);


        return response()->json(['message'=>'User created successfully','user'=>$user,Response::HTTP_CREATED]);
     
    }

    // cree une fonction qui envoie un email a un utilisateur par son email
    public function sendEmail($email)
    {
        $user = User::where('email', $email)->first();
        if (!$user) {
            return response()->json(['message' => 'Email not foundiii'], Response::HTTP_NOT_FOUND);
        }
        $user->notify(new InscriptionReussiNotification($user->name));
        return response()->json(['message' => 'Email sent'], Response::HTTP_OK);
    }


    public function Login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Invalid credentials'], Response::HTTP_UNAUTHORIZED);
        }

        $token = $user->createToken('token')->plainTextToken;

        $cookie=cookie('jwt',$token,60*24); // 1 day

        return response()->json(['message' => 'Login successful', 'token' => $token], Response::HTTP_OK)->withCookie($cookie);
    }

    // logged user
    public function User(Request $request)
    {
        return $request->user();
    }

    public function Logout()
    {
        $cookie=Cookie::forget('jwt');
        return response()->json(['message'=>'logout successfull'],Response::HTTP_OK)->withCookie($cookie);
    }

   
}
