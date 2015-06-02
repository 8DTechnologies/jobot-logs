#  [![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Dependency Status][daviddm-image]][daviddm-url]

> Jobot logging helper


## Install

```sh
$ npm install --save jobot-logs
```
* add jobot-logs to the file external-scripts.json

```json
["jobot-logs"]
```

## Usage
This package assumes hubot output is logged to a file  #{hubot.name}.log in a directory LOG_DIR
```
>> hubot show log 
```

* hubot show log
* hubot log size
* hubot show old log (date) at (time)
* hubot log size

[scripts/logs.coffee](/blob/master/scripts/logs.coffee) for details
## License

MIT © [8D Technologies](https://github.com/8DTechnologies)


[npm-image]: https://badge.fury.io/js/jobot-logs.svg
[npm-url]: https://npmjs.org/package/jobot-logs
[travis-image]: https://travis-ci.org/scboucher/jobot-logs.svg?branch=master
[travis-url]: https://travis-ci.org/scboucher/jobot-logs
[daviddm-image]: https://david-dm.org/scboucher/jobot-logs.svg?theme=shields.io
[daviddm-url]: https://david-dm.org/scboucher/jobot-logs
