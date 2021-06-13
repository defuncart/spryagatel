#!/usr/bin/env bash

# enable arb_utils globally on machine
# if already enabled, this will download latest version, if one is available
dart pub global activate arb_utils

# generate arb files
flutter pub run arb_generator

# sort arbs
pub global run arb_utils:sort assets_dev/l10n/intl_en.arb
pub global run arb_utils:sort assets_dev/l10n/intl_de.arb

# generate pseudo localizations
flutter pub run flutter_pseudolocalizor

# generate localization delegates
flutter pub run intl_utils:generate

# format loca delegates
flutter format lib/generated
