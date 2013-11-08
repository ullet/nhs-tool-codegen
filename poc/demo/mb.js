var myth_buster = $.QueryString['mb'];
var content = $('<div></div>')
if (myth_buster) {
  content.load('generated/' + myth_buster.toLowerCase() + '_myth_buster.html');
}

$(document).ready(initialize);

function initialize() {
  setTitle();
  intro();
}

function setTitle() {
  document.title = content.find('.meta .title').text();
}

function intro() {
  setContent(content.find('.intro'));
  setStartNav();
  setMoreInfoNav(-1, null);
}

function question(index) {
  setContent(questions().eq(index));
  setNavForQuestion(index);
}

function answerQuestion(questionIndex, answer) {
  correct = answer.is($('.correct'));
  // TODO: replace alert with something less intrusive
  alert(correct ? correctMessage() : incorrectMessage());
  explanation(questionIndex);
}

function correctMessage() {
  return ' :-) ';
}

function incorrectMessage() {
  return ' :-( ';
}

function explanation(questionIndex) {
  setContent(explanations().eq(questionIndex));
  setNavForExplanation(questionIndex)
}

function setContent(element) {
  $('#myth-buster').empty().append(element.clone());
}

function setStartNav() {
  $('.start').click(start);
}

function start() {
  question(0);
}

function questions() {
  return content.find('.questions .question');
}

function explanations() {
  return content.find('.questions .explanation');
}

function setNavForQuestion(questionIndex) {
  setSkipNav(questionIndex);
  setAnswerNav(questionIndex);
  setMoreInfoNav(questionIndex, question);
}

function setNavForExplanation(questionIndex) {
  setSkipNav(questionIndex);
  setMoreInfoNav(questionIndex, explanation);
}

function setSkipNav(questionIndex) {
  if (questionIndex > 0)
    $('.previous').click(function() { question(questionIndex-1); });
  if (questionIndex < lastQuestionIndex())
    $('.next').click(function() { question(questionIndex+1); });
}

function setAnswerNav(questionIndex) {
  $('.true').click(function() { answerQuestion(questionIndex, $(this)); });
  $('.false').click(function() { answerQuestion(questionIndex, $(this)); });
}

function setMoreInfoNav(questionIndex, returnAction) {
  $('.more-info').click(
    function() { moreInfo(questionIndex, returnAction) });
}

function moreInfo(questionIndex, returnAction) {
  setContent(content.find('div.more-info'));
  if (questionIndex < 0)
    $('.back').click(intro);
  else
    $('.back').click(function() { returnAction(questionIndex) });
}

function lastQuestionIndex() {
  return questions().size() - 1;
}
