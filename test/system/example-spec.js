'use strict';

var should = require('should');

var personA, personB;

describe('<Unit Test>', function() {
  describe('Example Test:', function() {
    beforeEach(function(done) {
      personA = { name : 'Peter', age : 24 };
      personB = { name : 'Marvin', age : 29 };
      done();
    });

    describe('Should mutate people', function() {

      it('should be different people', function(done) {
        should.notDeepEqual(personA, personB);
        done();
      });

      it('should update name', function(done) {
        personA.name = 'Fred';
        personA.name.should.equal('Fred');
        done();
      });

      it('should add gender', function(done) {
        personA.gender = 'Male';
        personA.should.have.property('gender');
        done();
      });

      it('should delete gender', function(done) {
        delete personA.gender;
        personA.should.not.have.property('gender');
        done();
      });

    });
  });
});