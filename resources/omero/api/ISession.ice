/*
 *   $Id$
 *
 *   Copyright 2010 Glencoe Software, Inc. All rights reserved.
 *   Use is subject to license terms supplied in LICENSE.txt
 *
 */

#ifndef OMERO_API_ISESSION_ICE
#define OMERO_API_ISESSION_ICE

#include <omero/ModelF.ice>
#include <omero/ServicesF.ice>
#include <omero/System.ice>

module omero {

    module api {

        /**
         * See <a href="http://hudson.openmicroscopy.org.uk/job/OMERO/javadoc/ome/api/ISession.html">ISession.html</a>
         **/
        ["ami", "amd"] interface ISession extends ServiceInterface
            {
                omero::model::Session createSession(omero::sys::Principal p, string credentials) throws ServerError;
                omero::model::Session createUserSession(long timeToLiveMilliseconds, long timeToIdleMilliseconds,
                                                        string defaultGroup, omero::model::Permissions umask) throws ServerError;
                omero::model::Session getSession(string sessionUuid) throws ServerError;
                int getReferenceCount(string sessionUuid) throws ServerError;
                int closeSession(omero::model::Session sess) throws ServerError;
                // System users
                omero::model::Session createSessionWithTimeout(omero::sys::Principal p,
                                                               long timeToLiveMilliseconds) throws ServerError;
                omero::model::Session createSessionWithTimeouts(omero::sys::Principal p,
                                                                long timeToLiveMilliseconds,
                                                                long timeToIdleMilliseconds) throws ServerError;

                // Listing
                SessionList getMyOpenSessions() throws ServerError;
                SessionList getMyOpenAgentSessions(string agent) throws ServerError;
                SessionList getMyOpenClientSessions() throws ServerError;

                // Environment
                omero::RType getInput(string sess, string key) throws ServerError;
                omero::RType getOutput(string sess, string key) throws ServerError;
                void setInput(string sess, string key, omero::RType value) throws ServerError;
                void setOutput(string sess, string key, omero::RType value) throws ServerError;
                StringSet getInputKeys(string sess) throws ServerError;
                StringSet getOutputKeys(string sess) throws ServerError;
                omero::RTypeDict getInputs(string sess) throws ServerError;
                omero::RTypeDict getOutputs(string sess) throws ServerError;
            };

    };
};

#endif