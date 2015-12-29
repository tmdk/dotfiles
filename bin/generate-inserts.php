#!/usr/bin/env php
<?php
$input = false;

function parse_arguments($args) {
	$arguments = new stdClass;
	$arguments->flags = array();
	$arguments->file = null;

	foreach ($args as $arg) {
		if (strpos($arg, '--') === 0) {
			list($flag_name, $flag_value) = explode('=', substr($arg, 2));
			$arguments->flags[$flag_name] = $flag_value;
		} else {
			$arguments->file = $arg;
		}
	}

	return $arguments;
}

$arguments = parse_arguments(array_slice($argv, 1));

$input = isset($arguments->file) ? file($arguments->file) : file('php://stdin');

if (empty($input)) {
	die('No input given.');
}

if (!isset($arguments->flags['format'])) {
	die('No input format specified.');
}

if (!isset($arguments->flags['table'])) {
	die('Please specify a table with --table=<table name>');
}

if (!isset($arguments->flags['types'])) {
	die('Please specify the column data types with --types=ssii..');
}

$table = $arguments->flags['table'];

if ($arguments->flags['format'] !== 'tsv') {
	die("Unsupported format '{$arguments->flags['format']}'");
}

if ($arguments->flags['format'] === 'tsv') {
	$delimiter = "\t";
}

$header = trim(array_shift($input));
$columns = explode($delimiter, $header);
if (count($columns) !== strlen($arguments->flags['types'])) {
	die('Column count does not match specified column data types.');
}

$types = $arguments->flags['types'];

if (count($input)) {
	echo sprintf("INSERT INTO %s (%s) VALUES\n", $table, implode(',', $columns));

	$first = true;

	foreach ($input as $row) {

		$values = array();
		$column_values = explode($delimiter, trim($row));
		for ( $i = 0; $i < count($column_values); ++$i ) {
			$values[] = $types[$i] === 's' ? '"' . addslashes($column_values[$i]) . '"' : $column_values[$i];
		}
		if (!$first)
			echo ",\n";
		echo sprintf("(%s)", implode(',', $values));
		if ($first)
			$first = false;
	}
}

echo ';';
