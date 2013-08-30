class GroovesController < ApplicationController

  def index

  end

  def create
    song = params[:song].to_s
    if !song.empty?
      song_id = groove_man.run(params[:song].to_s)
      pusher_man.transmit("add_list", song_id)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def play_control
    command = params[:command].to_s
    if !command.empty?
      pusher_man.transmit("play_control", command)
    end
    redirect_to root_path
  end

private

  def pusher_man
    @pusher ||= PusherManager.new
  end

  def groove_man
    @groove ||= Groove.new
  end
end
