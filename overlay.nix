self: super:
with super.lib;
foldr composeExtensions (_: _: { }) [ (import ./pkgs) ] self super
