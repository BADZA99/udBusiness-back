<?php


use App\Http\Controllers\CategorieController;
use App\Http\Controllers\DemandeController;
use App\Http\Controllers\profileController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use Laravel\Socialite\Facades\Socialite;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// user
// route pour lister les users

Route::post('register', [AuthController::class, 'Register']);
Route::post('login', [AuthController::class, 'Login']);
Route::middleware('auth:sanctum')->group(function(){
    Route::post('logout', [AuthController::class, 'Logout']);
    Route::get('user', [AuthController::class, 'User']);
});

Route::post('updateUser/{id}', [UserController::class, 'updateUser']);
Route::post('createDemande', [DemandeController::class, 'createDemande']);

Route::delete('deleteDemande/{id}', [DemandeController::class, 'deleteDemande']);
Route::patch('updateDemande/{id}', [DemandeController::class, 'updateDemande']);
Route::delete('deleteService/{id}', [ServiceController::class, 'deleteService']);
Route::patch('updateService/{id}', [ServiceController::class, 'updateService']);
Route::post('createService', [ServiceController::class, 'createService']);

// deconnexion
// Route::post('/logoutGoogle', function (Request $request) {
//     // Déconnecter l'utilisateur
//     Auth::logout();

//     // Invalider la session
//     $request->session()->invalidate();

//     // Régénérer le token CSRF
//     $request->session()->regenerateToken();

//     // Rediriger vers le frontend après la déconnexion
//     return redirect()->to('http://localhost:3000'); // Ajustez l'URL à votre application React
// });

// Route::post('/logoutGoogle', function (Request $request) {
//     // Révoquer le token de l'utilisateur actuellement connecté
//     $request->user()->currentAccessToken()->delete();

//     // Si l'utilisateur s'est connecté via Google, déconnecter de Google
//     // if ($request->user()->google_id) {
//     //     // Révoquer les permissions avec Google (optionnel)
//     //     // Faire une requête à l'API de Google pour révoquer l'accès si nécessaire
//     // }

//     return response()->json(['message' => 'Logged out successfully']);
// });



Route::get('sendMail/{id}', [AuthController::class, 'sendEmail']);

// profile
Route::get('profiles', [profileController::class, 'allProfiles']);

// demandes

Route::get('demandes', [DemandeController::class, 'allDemandes']);
Route::get('userDemandes/{id}', [DemandeController::class, 'userDemandes']);
Route::get('categorieDemandes/{id}', [DemandeController::class, 'categorieDemandes']);
// Route::delete('deleteDemande/{id}', [DemandeController::class, 'deleteDemande']);
// Route::patch('updateDemande/{id}', [DemandeController::class, 'updateDemande']);

// services
//Route::post('createService', [ServiceController::class, 'createService']);
Route::get('services', [ServiceController::class, 'allServices']);
Route::get('services/{id}', [ServiceController::class, 'userServices']);

// categories
Route::get('categories', [CategorieController::class, 'getCategories']);

// $ composer config -g -- disable-tls true