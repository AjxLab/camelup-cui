# frozen_string_literal: true

require_relative './dialog'

system('clear')

@dialog = Dialog.instance
@dialog.draw_frame
@dialog.message 'あなたのターンです', center: true
@dialog.message(
  'サイコロを振る',
  '> 馬券を獲得する',
  'オアシスを配置する',
  '蜃気楼を配置する',
  start_x: 10,
  start_y: 2
)

sleep 3
