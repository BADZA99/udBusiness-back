<?php


use App\Http\Controllers\CategorieController;
use App\Http\Controllers\DemandeController;
use App\Http\Controllers\profileController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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
Route::post('register', [AuthController::class, 'Register']);
Route::post('login', [AuthController::class, 'Login']);
Route::middleware('auth:sanctum')->group(function(){
    Route::post('logout', [AuthController::class, 'Logout']);
    Route::get('user', [AuthController::class, 'User']);
    Route::post('updateUser/{id}', [UserController::class, 'updateUser']);
    Route::post('createDemande', [DemandeController::class, 'createDemande']);
    Route::post('createService', [ServiceController::class, 'createService']);
    Route::delete('deleteDemande/{id}', [DemandeController::class, 'deleteDemande']);
    Route::patch('updateDemande/{id}', [DemandeController::class, 'updateDemande']);
});


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

