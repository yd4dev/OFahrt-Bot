package bot;

import net.dv8tion.jda.api.EmbedBuilder;
import net.dv8tion.jda.api.entities.Message;
import net.dv8tion.jda.api.entities.MessageEmbed;
import net.dv8tion.jda.api.entities.channel.Channel;
import net.dv8tion.jda.api.entities.channel.middleman.MessageChannel;
import net.dv8tion.jda.api.entities.emoji.Emoji;
import net.dv8tion.jda.api.events.interaction.component.ButtonInteractionEvent;
import net.dv8tion.jda.api.events.message.MessageReceivedEvent;
import net.dv8tion.jda.api.hooks.ListenerAdapter;
import net.dv8tion.jda.api.interactions.components.buttons.Button;
import net.dv8tion.jda.api.requests.RestAction;
import net.dv8tion.jda.api.requests.restaction.MessageCreateAction;
import net.dv8tion.jda.api.utils.messages.MessageCreateBuilder;
import org.jetbrains.annotations.NotNull;

public class MessageListener extends ListenerAdapter
{
    @Override
    public void onMessageReceived(@NotNull MessageReceivedEvent event) {
        if (event.getAuthor().isBot()) return;
        // We don't want to respond to other bot accounts, including ourselves
        Message message = event.getMessage();
        String content = message.getContentRaw();
        // getContentRaw() is an atomic getter
        // getContentDisplay() is a lazy getter which modifies the content for e.g. console view (strip discord formatting)
        if (content.equals("!ping")) {
            MessageChannel channel = event.getChannel();
            channel.sendMessage("Pong!").queue(); // Important to call .queue() on the RestAction returned by sendMessage(...)
        } else if (content.equals("!rps")) {
            rpsCommand(event);
        }
    }

    private void rpsCommand(MessageReceivedEvent event) {
        event
                .getMessage()
                .replyEmbeds(new EmbedBuilder()
                        .setTitle("Rock, Paper, Scissors!")
                        .build())
                .addActionRow(
                        Button.primary("rock", Emoji.fromUnicode("\uD83E\uDEA8")),
                        Button.primary("paper", Emoji.fromUnicode("\uD83D\uDCC3")),
                        Button.primary("scissors", Emoji.fromUnicode("✂\uFE0F")))
                .queue();
    }

    @Override
    public void onButtonInteraction(@NotNull ButtonInteractionEvent event) {
        Button button = event.getButton();
        if (button.getId() == null) return;
        String x;
        switch (button.getId()) {
            case "rock" -> {
                x = "\uD83D\uDCC3";
            }
            case "paper" -> {
                x = "✂\uFE0F";
            }
            case "scissors" -> {
                x = "\uD83E\uDEA8";
            }
            default -> {
                return;
            }
        }
        event.reply("I play " + x + "! You lose!").setEphemeral(true).queue();
    }
}
