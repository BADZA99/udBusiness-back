<?php

namespace App\Http\Controllers;

use App\Models\Categories;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CategorieController extends Controller
{
    //crre la fonction qui retourne toutes les categories
    public function getCategories()
    {
        $categories = Categories::all();
        return response()->json(['categories' => $categories], Response::HTTP_OK);
    }
}
