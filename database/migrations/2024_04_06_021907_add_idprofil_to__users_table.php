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
            //ajoute la colonne idProfile 
            $table->unsignedBigInteger('idProfile')->nullable();
            $table->foreign('idProfile')->references('id')->on('profile');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('_users', function (Blueprint $table) {
            //fais le contraire
            $table->dropForeign(['idProfile']);
            $table->dropColumn('idProfile');
        });
    }
};
