'use strict';
var assert = require('assert');
var jobotLogs = require('../');

describe('jobot-logs node module', function () {
  it('must have at least one test', function () {
    jobotLogs();
    assert(false, 'I was too lazy to write any tests. Shame on me.');
  });
});
