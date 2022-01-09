#!/usr/bin/env bash

# enable arb_utils globally on machine
# if already enabled, this will download latest version, if one is available
dart pub global activate arb_utils

# ensure all deps are available
dart pub get

# generate arb files
dart run arb_generator

# sort arbs
dart pub global run arb_utils:sort assets_dev/l10n/intl_en.arb
dart pub global run arb_utils:sort assets_dev/l10n/intl_de.arb

# generate pseudo localizations
dart run flutter_pseudolocalizor

# generate localization delegates
dart run intl_utils:generate

# format loca delegates
dart format lib/generated
