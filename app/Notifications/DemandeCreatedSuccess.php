<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class DemandeCreatedSuccess extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     */
    // nom,prenom,titreDemande
    public $nom;
    public $prenom;
    public $titreDemande;
    public function __construct(
         $nom,
         $prenom,
         $titreDemande
    ) {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->titreDemande = $titreDemande;
    }

   

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
            ->greeting("Bonjour {$this->prenom} {$this->nom} !")
            ->line("Nous sommes heureux de vous informer que votre demande intitulée '{$this->titreDemande}' a été publiée avec succès sur udFreelance.")
            ->action('Voir la Demande', url('/'))
            ->line('Merci d’utiliser udFreelance pour vos projets !');
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            //
        ];
    }
}
