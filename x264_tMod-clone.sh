# Source: http://astrataro.wordpress.com/x264_tmod-clone-sh/
# Just put it here to make it easier to download.  --Beining
#!/usr/bin/env bash
 
# Originally for L-SMASH project.
# Modified for tMod.
# I do not claim any further copyright.
 
# This file is part of L-SMASH project.
# http://github.com/silverfilain/x264_L-SMASH
 
# Copyright (C) 2010-2013 L-SMASH project
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 
# Mar. 12, 2013 Lucien
#     Simplified for tMod.
# Aug. 26, 2010 Takashi Hirata
#     Initial release for unofficial repository of L-SMASH.
# Sep. 20, 2010 Takashi Hirata
#     Change cloning of official repo to optional.
#     Add help.
#     Remove pushurl settings.
 
working_dir=x264_tMod
 
tmod_repo=git://github.com/astrataro/x264_tMod.git
orig_repo=git://github.com/DarkShikari/x264-devel.git
lsms_repo=git://github.com/silverfilain/x264_L-SMASH.git
 
orig_remo=porigin
lsms_remo=lorigin
 
fatal(){
    echo -n "ERROR: "
    echo $1
    exit 1
}
 
#### cloning ####
 
echo "INFO: ==== CLONING FROM $tmod_repo"
git clone $tmod_repo $working_dir       || fatal "failed to clone repo $tmod_repo"
cd $working_dir
 
git remote add $orig_remo $orig_repo    || fatal "failed to clone repo $orig_repo."
git remote add $lsms_remo $lsms_repo    || fatal "failed to clone repo $lsms_repo."
 
git fetch $orig_remo                    || fatal "failed to fetch from $orig_repo."
git fetch $lsms_remo                    || fatal "failed to fetch from $lsms_repo."
 
git branch plain  $orig_remo/master     || fatal "failed to create branch plain."
git branch kaudio $lsms_remo/kaudio     || fatal "failed to create branch kaudio."
git branch lsmash $lsms_remo/lsmash     || fatal "failed to create branch lsmash."
 
echo "INFO: finished."
echo "INFO: use 'git branch' to check your branch setup."
