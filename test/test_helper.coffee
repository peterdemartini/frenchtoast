chai           = require 'chai'
sinon          = require 'sinon'
sinonChai      = require 'sinon-chai'
chaiAsPromised = require 'chai-as-promised'

chai.use chaiAsPromised
chai.use sinonChai

global.expect = chai.expect;
global.sinon  = sinon;
