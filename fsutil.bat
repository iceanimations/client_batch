rem This script is for enabling the Symlink evaluation on the client side. remote-to-remote (R2R) symlink evalution has to be enabled in order to make actual project data that is spread on different locations, also accessible by client, be available from a single location. TACTIC's constraint. Difficult to setup but seemingly convenient in the long run.
rem add this script to the startup policy.


rem disable all first
fsutil behavior set SymlinkEvaluation L2L:0 R2R:0 L2R:0 R2L:0

rem enable R2R
fsutil behavior set SymlinkEvaluation L2L:1 R2R:1 L2R:1 R2L:1
