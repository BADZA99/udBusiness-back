<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class InscriptionReussiNotification extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     * apres modif .env faire php artisan config:cache pour que les variables d'environnement soient prises en compte
     */
    public $name;
    // public $role;
    public function __construct($name)
    {
        $this->name = $name;
        // $this->role = $role;
        //
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
            ->subject('Inscription réussie')
            ->greeting('Bonjour, ' . $this->name . ' 👋')
            ->line('Nous sommes ravis de vous informer que votre inscription sur UD s\'est bien passée.')
            // ->action('Visitez notre site', url('/'))
            ->line('Merci d\'avoir choisi notre application!');
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
