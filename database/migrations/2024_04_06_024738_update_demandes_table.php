<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */

    //  TODO/ CREER UN COLONNE IMAGE POUR DEMANDES profile ET SERVICES
    //  TODO/ CREER UN COLONNE CV POUR USERS 
    public function up(): void
    {
        //ajoute la cle etrangere categorie_id
        Schema::table('demandes', function (Blueprint $table) {
            $table->unsignedBigInteger('categorie_id')->nullable();
            $table->foreign('categorie_id')->references('id')->on('categories');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //le contraire
        //
        Schema::table('demandes', function (Blueprint $table) {
            $table->dropForeign(['categorie_id']);
            $table->dropColumn('categorie_id');
        });
    }
};
