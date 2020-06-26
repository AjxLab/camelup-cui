#! /usr/bin/env ruby
##--------------------------------------------------------------------------------------
#  CamelUpを起動
#--------------------------------------------------------------------------------------
#  作成者: 阿部 竜也
#  作成日: 2020/06/27
#--------------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------------


class CamelUp
  def initialize
    #--------------------------------------------
    # コンストラクタ
    #--------------------------------------------
    # params:
    #   - roomid:string -> 接続先のRoomID
    #   - roompw:string -> 接続先のRoomPW
    # return:
    #   - 接続に成功したか？
    #--------------------------------------------
  end


  def connect(roomid, roompw)
    #--------------------------------------------
    # Roomに接続
    #--------------------------------------------
    # params:
    #   - roomid:string -> 接続先のRoomID
    #   - roompw:string -> 接続先のRoomPW
    # return:
    #   - 接続に成功したか？
    #--------------------------------------------
    return true
  end
end


if __FILE__ == $0
  game = CamelUp.new

  # connect to room
  print "Enter RoomID："; roomid = gets.to_s.chomp
  print "Enter RoomPW："; roompw = gets.to_s.chomp

  print "\ntrying to connect to a room..."
  if game.connect(roomid, roompw)
    puts "\e[32mdone\e[0m"
  else
    puts "\e[31merror\e[0m"
    exit 1
  end
end

