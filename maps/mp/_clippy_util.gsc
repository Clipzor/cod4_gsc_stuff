enablelinkto_hook() { // try this later
    if(!isdefined(self))
        return;

    if(!isDefined(self.canLinkTo) || self.canLinkTo == false)
        self enableLinkTo();
}
