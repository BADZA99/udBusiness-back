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
        //ajoutenomPrestataire et telephonePresta
        Schema::table('services', function (Blueprint $table) {
            $table->string('nomPrestataire')->nullable();
            $table->string('telephonePresta')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //le contraire
        Schema::table('services', function (Blueprint $table) {
            $table->dropColumn('nomPrestataire');
            $table->dropColumn('telephonePresta');
        });
    }
};
