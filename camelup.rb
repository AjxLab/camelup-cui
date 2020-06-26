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
    @n_players = 4

    # calculate terminal size
    @weight = `tput cols`.to_i
    @weight = (@weight  - 5*(@n_players-1) - 10) / @n_players * @n_players + 5*(@n_players-1)
    @height = `tput lines`.to_i - 10

    draw_frame
    sleep 3
  end


  def draw_frame
    #--------------------------------------------
    # 画面フレームを描画
    #--------------------------------------------
    puts "#" * (@weight+10)
    (@height+8).times {
      print "#    " <<
      " " * @weight <<
      "    #"
      puts
    }
    print "#" * (@weight+10)

    # move cursor to the initial position
    print "\e[#{@height+10}A\e[#{@weight+10}D"
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

