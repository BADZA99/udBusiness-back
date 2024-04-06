<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            //ajoute la colonne tarif,solde et cv 
            $table->integer('tarif')->nullable();
            $table->integer('solde')->nullable();
            $table->mediumText('cv')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            //le contraire
            $table->dropColumn('tarif');
            $table->dropColumn('solde');
            $table->dropColumn('cv');
        });
    }
};
