<?php
$foo = 'Bob';              // Assign the value 'Bob' to $foo
$bar = &$foo;              // Reference $foo via $bar.

echo "bar : $bar\n";

$bar = "My name is $bar\n";  // Alter $bar...

echo "bar : $bar\n";

echo"foo: $foo";                 // $foo is altered too.
?>
