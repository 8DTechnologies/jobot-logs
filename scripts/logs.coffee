# Description:
#  Display log for hubot
# Configuration:
# LOG_DIR:  directory that contains the hubot output
# Commands:
#
#   hubot show log <n> - Print hubot logs <n> last lines of hubot.log, default 100 lines
#   hubot show old log <n> from <%m_%d_%y> at <%H:%M> - Print the last lines of <%m_%d_%y-%H:%M>.log
#   hubot list log - Print a list of available logs.
#   hubot log size - Print the current size of hubot log directory.

{exec} = require('child_process')
fs = require 'fs'
Path = require 'path'

module.exports = (robot) ->
  robot.respond /show logs?( \d+)?/i, (msg) ->
#    msg.envelope.user = msg.envelope.user.privateChatJid
    msg.envelope.user.type = 'chat'
    endLine = msg.match[1]
    respond = ""
    logLines = fs.readFileSync Path.join process.env.LOG_DIR or= "", "#{robot.name}.log"
    .toString()
    .split('\n')
    logLines = if endLine > 0 then logLines[-endLine..] else logLines[-200..]
    msg.reply (respond += "#{line}\n" for line in logLines)


  robot.respond /show old logs?( \d+)? from (\d\d_\d\d_\d\d) at (\d\d:\d\d)/i, (msg) ->
    msg.envelope.user.type = 'chat'
    respond = ""
    endline = msg.match[1]
    try
      logLines = (fs.readFileSync "#{process.env.LOG_DIR}/#{msg.match[2]}-#{msg.match[3]}.log").toString().split('\n')
      robot.logger.info lines for lines in  logLines
      lines = if endline > 0 then logLines[-endline..] else logLines[-200..]
      respond += "#{line} \n" for line in lines
    catch err then respond = "No such log #{err}"
    finally
      msg.send respond

  robot.respond /list logs?/i, (msg) ->
    msg.envelope.user.type = 'chat'
    respond = "You can access the following files :\n"
    i = 0
    try
      logDir = fs.readdirSync process.env.LOG_DIR
      respond += "#{++i}- #{name} \n" for name in logDir when name isnt '#{hubot.name}.log'
    catch err then respond = "could not read the directory properly:  #{err}"
    finally
      msg.send respond


  robot.respond /logs? size/, (msg) ->
    msg.envelope.user.type = 'chat'
    cmd = exec "cd #{process.env.LOG_DIR} && du -hs"
    cmd.stdout.on 'data', (data) ->
      msg.send data
