# frozen_string_literal: true

require_relative './dialog'

def draw_title
  system('clear')
  system('figlet -f slant CAMEL UP')
  print "\e[6A"
end

draw_title

@dialog = Dialog.instance
@dialog.reset
@dialog.message 'あなたのターンです', center: true, start_y: 1
@dialog.message(
  'サイコロを振る',
  '> 馬券を獲得する',
  'オアシスを配置する',
  '蜃気楼を配置する',
  start_x: 10,
  start_y: 3
)

sleep 3
