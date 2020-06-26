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
    @type = [41, 42, 43, 44, 47]

    # calculate terminal size
    @weight = `tput cols`.to_i
    @weight = (@weight  - 5*(@n_players-1) - 6) / @n_players * @n_players + 5*(@n_players-1)
    @height = `tput lines`.to_i - 4

    draw_frame
    draw_horse(0, 0, 0)
    draw_horse(1, 0, 2)
    draw_horse(2, 0, 4)
    draw_horse(3, 12, 2)
    draw_horse(4, 12, 4)
    sleep 10
  end


  def draw_frame
    #--------------------------------------------
    # 画面フレームを描画
    #--------------------------------------------
    puts "#" * (@weight+6)
    (@height+2).times {
      print "#  " <<
      " " * @weight <<
      "  #"
      puts
    }
    print "#" * (@weight+6)

    # move cursor to the initial position
    print "\e[#{@height+4}A\e[#{@weight+6}D"
  end


  def draw_horse(type, x, y)
    #--------------------------------------------
    # 馬を描画
    #--------------------------------------------
    # params:
    #   - type;int -> 描画する馬のタイプ（0〜4）
    #   - x:int -> 描画開始するX座標
    #   - y:int -> 描画開始するY座標
    #--------------------------------------------
    x += 3
    y += 2

    horse = [
      "ooo oo oo",
      " oooooooo",
      "   o  o",
    ]
    horse.map! { |line| line.gsub(' ', "\e[1C") }
    horse.map! { |line| line.gsub('o', "\e[#{@type[type]}m \e[0m") }

    # draw
    print "\e[#{y}B"
    horse.each do |line|
      print "\e[#{x}C#{line}\n"
    end

    # move cursor to the initial position
    print "\e[#{@height+4}A\e[#{@weight+6}D"
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

