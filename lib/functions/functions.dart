
var hello = (String name) => 'Hello, $name';


Function concat(String s1) {
  return (String s2) => s2 + s1;
}