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

current_line = 0
while (key = $stdin.getch) != "\C-c"
  next unless key == "\e" && ($stdin.getch == '[')

  dialog.message 'あなたのターンです', center: true, y: 1
  tmp_msgs = messages.clone

  # 入力キーで分岐
  case $stdin.getch
  when 'A'
    current_line -= 1  if current_line.positive?
  when 'B'
    current_line += 1  if current_line < messages.length - 1
  end

  tmp_msgs.map!.with_index { |msg, i| i == current_line ? "> #{msg}" : "  #{msg}" }
  tmp_msgs.map! { |msg| "#{msg}  " }
  dialog.message(
    *tmp_msgs,
    x: 10 - 2,
    y: 3
  )
end

print "\e[?12;25h"
