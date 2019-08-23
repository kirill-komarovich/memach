# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MessageHandlers::StartHandler do
  subject { MessageHandlers::StartHandler.new(message: message) }

  describe '#handle' do
    context 'when message is not start command' do
      let(:message) { build(:telegram_message) }

      it 'does nothing' do
        expect(subject).to receive(:start_command?).and_return(false)

        subject.handle
      end
    end

    context 'when message is bot command' do
      let(:message) do
        build(
          :telegram_message,
          :bot_command,
          text: MessageHandlers::StartHandler::START_COMMAND_TEXT
        )
      end
      let(:send_message_params) do
        {
          text: "Hello, #{message.from.first_name}",
          chat_id: message.chat.id
        }
      end

      it 'creates new user and sends message' do
        expect(Bot['telegram.bot'].api).to receive(:send_message).with(send_message_params)

        expect { subject.handle }.to change { User.count }.by(1)
      end

      context 'when user already exists' do
        let(:user) { build(:user) }

        before do
          allow(User).to receive(:new).and_return(user)
          allow(user).to receive(:save).and_return(false)
        end

        it 'does nothing' do
          expect(Bot['telegram.bot'].api).not_to receive(:send_message)

          expect { subject.handle }.to change { User.count }.by(0)
        end
      end
    end
  end
end
