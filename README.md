# DrupalScan

## Introduction

Simple Drupal scanner to enumerate modules and get the drupal version. Module description is automatically fetched from drupal.org.

## Installation

DrupalScan can be installed very easy via rubygems:

```
gem install DrupalScan
```

## Usage (command line)

```
% DrupalScan -h
Usage: DrupalScan <url> [--no-module-lookup]
    -u, --url URL                    URL of drupal project. Example: http://drupal.org
    -n, --no-module-lookup           Disable module lookup on drupal.org
    -h, --help                       Show this help

% DrupalScan -u http://drupal.org
Version: Drupal 6.26, 2012-05-02
- flot
- - This module provides an API and views integration for using the flot graphing library. It is designed to make it simple to add flot graphs or charts, it supports line, bar and pie charts.

- drupalorg
- - Customizations used on drupal.org itself.  It is not meant to be useful to other sites, except as an educational example of the kinds of modifications you can make via a site-specific module.

- token
- - Tokens are small bits of text that can be placed into larger documents via simple placeholders, like %site-name or [user]. The Token module provides a central API for modules to use these tokens, and expose their own token values.

- httpbl
- - Implementation of http:BL for Drupal. http:BL can prevent email address harvesters and comment spammers from visiting your site by using a centralized DNS blacklist. It requires a free Project Honey Pot membership. This module provides efficient blacklist lookups and blocks malicious visitors effectively.

```

## Usage (ruby)

```
require 'DrupalScan'
modules = DrupalScan::enumerateModules("http://drupal.org")
version = DrupalScan::getVersion("http://drupal.org")
```
