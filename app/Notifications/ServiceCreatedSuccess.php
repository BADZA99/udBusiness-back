<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ServiceCreatedSuccess extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     */
    // nom,prenom,titreService
    public $nom;
    public $prenom;
    public $titreService;
    public function __construct(
         $nom,
         $prenom,
         $titreService
    ) {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->titreService = $titreService;
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
            ->line("Nous sommes heureux de vous informer que votre service intitulé '{$this->titreService}' a été publié avec succès sur udFreelance.")
            ->action('Voir le Service', url('/'))
            ->line('Merci d’utiliser udFreelance pour promouvoir vos services !');
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
