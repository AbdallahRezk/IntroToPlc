#include "backend.h"
#include "serverStuff.h"

Backend::Backend(QObject *parent) : QObject(parent)
{
    server = new ServerStuff();
    //client = new ClientStuff("192.168.1.4", 6544);
    client = new ClientStuff("localhost", 6544);


    connect(server, &ServerStuff::gotNewMesssage, this, &Backend::gotNewMesssage);
    connect(server->tcpServer, &QTcpServer::newConnection, this, &Backend::smbConnectedToServer);
    connect(server, &ServerStuff::smbDisconnected, this, &Backend::smbDisconnectedFromServer);


    //setStatus(client->get_status());

    connect(client, &ClientStuff::hasReadSome, this, &Backend::receivedSomething);
    connect(client, &ClientStuff::statusChanged, this, &Backend::setStatus);
    // FIXME change this connection to the new syntax
    connect(client->tcpSocket, SIGNAL(error(QAbstractSocket::SocketError)),
            this, SLOT(gotError(QAbstractSocket::SocketError)));
}



bool Backend::getStatus()
{
    return client->getStatus();
}

void Backend::setStatus(bool newStatus)
{
    //qDebug() << "new status is:" << newStatus;
    if (newStatus)
        { emit statusChanged("CONNECTED"); }
    else
        { emit statusChanged("DISCONNECTED"); }
}

void Backend::receivedSomething(QString msg)
{
    emit someMessage(msg);
}

void Backend::gotError(QAbstractSocket::SocketError err)
{
    //qDebug() << "got error";
    QString strError = "unknown";
    switch (err)
    {
        case 0:
            strError = "Connection was refused";
            break;
        case 1:
            strError = "Remote host closed the connection";
            break;
        case 2:
            strError = "Host address was not found";
            break;
        case 5:
            strError = "Connection timed out";
            break;
        default:
            strError = "Unknown error";
    }

    emit someError(strError);
}

void Backend::connectClicked()
{
    client->connect2host();
}
void Backend:: sendclicked2(quint8 msg){

    QByteArray arrBlock;
    QDataStream out(&arrBlock, QIODevice::WriteOnly);
    //out.setVersion(QDataStream::Qt_5_10);
    out << quint16(0) << msg;
    //out << msg;


    out.device()->seek(0);
    out << quint16(arrBlock.size() - sizeof(quint16));

    client->tcpSocket->write(arrBlock);

}
//////////send function//////////////////

// void Backend::sendClicked(QString msg)
// {
//     QByteArray arrBlock;
//     QDataStream out(&arrBlock, QIODevice::WriteOnly);
//     //out.setVersion(QDataStream::Qt_5_10);
//     out << quint16(0) << msg;
//     //out << msg;


//     out.device()->seek(0);
//     out << quint16(arrBlock.size() - sizeof(quint16));

//     client->tcpSocket->write(arrBlock);
// }

void Backend::sendClicked(QString msg)
{
    client->tcpSocket->write(msg.toUtf8());
}


void Backend::disconnectClicked()
{
    client->closeConnection();
}

/////////////////////////////////////////////////////server ///////////////////////////



QString Backend::startClicked()
{
    if (!server->tcpServer->listen(QHostAddress::Any, 6545))
    {
        return "Error! The port is taken by some other service";
    }
    else
    {
        connect(server->tcpServer, &QTcpServer::newConnection, server, &ServerStuff::newConnection);
        return "Server started, port is openned";
    }
}

QString Backend::stopClicked()
{
    if(server->tcpServer->isListening())
    {
        disconnect(server->tcpServer, &QTcpServer::newConnection, server, &ServerStuff::newConnection);

        QList<QTcpSocket *> clients = server->getClients();
        for(int i = 0; i < clients.count(); i++)
        {
            //server->sendToClient(clients.at(i), "Connection closed");
            server->sendToClient(clients.at(i), "0");
        }

        server->tcpServer->close();
        return "Server stopped, post is closed";
    }
    else
    {
        return "Error! Server was not running";
    }
}

QString Backend::testClicked()
{
    if(server->tcpServer->isListening())
    {
        return QString("%1 %2")
            .arg("Server is listening, number of connected clients:")
            .arg(QString::number(server->getClients().count()));
    }
    else
    {
        return QString("%1 %2")
            .arg("Server is not listening, number of connected clients:")
            .arg(QString::number(server->getClients().count()));
    }
}

void Backend::smbConnectedToServer()
{
    emit smbConnected();
}

void Backend::smbDisconnectedFromServer()
{
    emit smbDisconnected();
}

void Backend::gotNewMesssage(QString msg)
{
    emit newMessage(msg);
}


