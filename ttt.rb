#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')

require 'tic_tac_toe/board'
require 'tic_tac_toe/game'
require 'tic_tac_toe/ai'
require 'tic_tac_toe/app'
require 'tic_tac_toe/console'
require 'tic_tac_toe/human'

app = App.new
app.run
