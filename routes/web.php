<?php

use App\Http\Controllers\AuthController;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Http\Request;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// connexion avec google
// route redirect et callback
Route::middleware(['web'])->group(function () {
    // Route pour rediriger l'utilisateur vers Google OAuth
    Route::get('/auth/google', function (Request $request) {
        return Socialite::driver('google')->redirect();
    });

    // Route pour gérer le rappel de Google OAuth
    Route::get('/auth/google/callback', function (Request $request) {
        try {
            $googleUser = Socialite::driver('google')->stateless()->user();
        } catch (\Exception $e) {
            // En cas d'erreur, rediriger vers une page d'erreur ou retourner une réponse d'erreur
            return response()->json(['error' => 'Impossible de s\'authentifier avec Google.'.$e], 401);
        }

        // Trouver ou créer l'utilisateur dans la base de données
        $user = User::firstOrCreate(
            ['email' => $googleUser->getEmail()],
            [
                'name' => $googleUser->getName(),
                'password' => Hash::make(uniqid()), // Générer un mot de passe aléatoire
                'google_id' => $googleUser->getId(),
            ]
        );
        // ENREGISTRER DANS LA BASE
        $user->save();

        // Connecter l'utilisateur
        Auth::login($user, true);

        // Créer le token
        $token = $user->createToken('auth_token')->plainTextToken;

        // Rediriger vers le frontend avec le token dans l'URL
        // return redirect()->to('https://ud-freelance.biz/layout/profile?token=' . $token);
        return redirect()->to('http://localhost:3000/?token=' . $token);
        // Rediriger vers le frontend avec un jeton ou une session
        // return redirect()->to('https://ud-freelance.biz/layout/profile'); // Ajustez l'URL à votre application React
    });

    
});
// deconnexion
// Route::post('/logoutES',  function (Request $request)
// {
//     // Révoquer le token de l'utilisateur actuellement connecté
//     $request->user()->currentAccessToken()->delete();

//     // Révoquer le token Google (si Google est utilisé pour la connexion)
//     if ($request->user()->google_token) {
//         $client = new \GuzzleHttp\Client();
//         $client->post('https://accounts.google.com/o/oauth2/revoke', [
//             'form_params' => [
//                 'token' => $request->user()->google_token,
//             ],
//         ]);
//     }

//     return response()->json(['message' => 'Logged out successfully']);
// }

Route::middleware('auth:sanctum')->group(function () {
    Route::post('logoutGoogle', [AuthController::class, 'LogoutGoogle']);
});



