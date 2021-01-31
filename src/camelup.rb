#! /usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
require_relative './dialog'

def draw_title
  print "\e[?25l"
  system('clear')
  system('figlet -f slant CAMEL UP')
  print "\e[6A"
end

draw_title

messages = %w[
  サイコロを振る
  馬券を獲得する
  オアシスを配置する
  蜃気楼を配置する
]

dialog = Dialog.instance
dialog.reset
dialog.message 'あなたのターンです', center: true, y: 1
dialog.message(
  *messages,
  x: 10,
  y: 3
)

i_cursor = 0
while (key = STDIN.getch) != "\C-c"
  dialog.message 'あなたのターンです', center: true, y: 1
  tmp_msgs = messages.clone

  if key == "\e" && (STDIN.getch == '[')
    case STDIN.getch
    when 'A'
      i_cursor -= 1  if i_cursor.positive?
    when 'B'
      i_cursor += 1  if i_cursor < messages.length - 1
    end
  end

  tmp_msgs[i_cursor] = '> ' + tmp_msgs[i_cursor]
  tmp_msgs.map! { |msg| msg + '  ' }
  dialog.message(
    *tmp_msgs,
    x: 10,
    y: 3
  )
end

print "\e[?12;25h"
