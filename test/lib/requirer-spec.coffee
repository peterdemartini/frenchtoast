Requirer = require '../../lib/requirer'
describe 'Requirer', ->
  beforeEach ->
    @sut = new Requirer

  describe '->getFile', ->
    describe 'when called with a valid file', ->
      beforeEach (done) ->
        path = __dirname + '/../../app/routes'
        @sut.getFile path, 'index.coffee', (@error, @file) => done()

      it 'should have a file', ->
        expect(@file).to.equal __dirname + '/../../app/routes/index.coffee' 

    describe 'when called with an invalid file', ->
      beforeEach (done) ->
        path = __dirname + '/../../app/routes'
        @sut.getFile path, 'incorrect.coffee', (@error, @file) => done()

      it 'should have a file', ->
        expect(@error).to.exist

    describe 'when called with a directory', ->
      beforeEach (done) ->
        path = __dirname + '/../../app/'
        @sut.getDirectoryFiles = sinon.stub().yields()
        @sut.getFile path, 'routes', => done()

      it 'should call getDirectoryFiles', ->
        expect(@sut.getDirectoryFiles).to.have.been.called
  