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
        //supprime les colonnes tarif,cv et solde
        Schema::table('profile', function (Blueprint $table) {
            $table->dropColumn('tarif');
            $table->dropColumn('cv');
            $table->dropColumn('solde');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //le contraire
        Schema::table('profile', function (Blueprint $table) {
            $table->integer('tarif')->nullable();
            $table->mediumText('cv')->nullable();
            $table->integer('solde')->nullable();
        });
    }
};
