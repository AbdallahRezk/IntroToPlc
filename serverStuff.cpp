#include "serverStuff.h"

ServerStuff::ServerStuff() : QObject(), m_nNextBlockSize(0)
{
    tcpServer = new QTcpServer();
}

QList<QTcpSocket *> ServerStuff::getClients()
{
    return clients;
}

void ServerStuff::newConnection()
{
    QTcpSocket *clientSocket = tcpServer->nextPendingConnection();

    connect(clientSocket, &QTcpSocket::disconnected, clientSocket, &QTcpSocket::deleteLater);
    connect(clientSocket, &QTcpSocket::readyRead, this, &ServerStuff::readClient);
    connect(clientSocket, &QTcpSocket::disconnected, this, &ServerStuff::gotDisconnection);

    clients << clientSocket;

    sendToClient(clientSocket, "Reply: connection established");
}

// void ServerStuff::readClient()
// {
//     QTcpSocket *clientSocket = (QTcpSocket*)sender();
//     QDataStream in(clientSocket);
//     //in.setVersion(QDataStream::Qt_5_10);
//     for (;;)
//     {
//         if (!m_nNextBlockSize)
//         {
//             if (clientSocket->bytesAvailable() < sizeof(quint16)) { break; }
//             in >> m_nNextBlockSize;
//         }

//         if (clientSocket->bytesAvailable() < m_nNextBlockSize) { break; }
//         QString str;
//         in >> str;

//         emit gotNewMesssage(str);

//         m_nNextBlockSize = 0;

//         if (sendToClient(clientSocket, QString("Reply: received [%1]").arg(str)) == -1)
//         {
//             qDebug() << "Some error occured";
//         }
//     }
// }

////////////////////////it is work/////////////////////
//////////////////////char////////////////////////////
// void ServerStuff::readClient()
// {
//     QTcpSocket *clientSocket = static_cast<QTcpSocket*>(sender());
//     QDataStream in(clientSocket);

//     while (clientSocket->bytesAvailable() > 0)
//     {
//         char ch;
//         in >> ch;

//         QString str = QString(ch);
//         qDebug() << "Received character:" << str;

//         emit gotNewMesssage(str);

//         if (sendToClient(clientSocket, QString("Reply: received [%1]").arg(str)) == -1)
//                      {
//                 qDebug() << "Some error occured";
//                      }
//                  }
//              }

void ServerStuff::readClient()
{
    QTcpSocket *clientSocket = static_cast<QTcpSocket*>(sender());
    QDataStream in(clientSocket);

    while (clientSocket->bytesAvailable() > 0)
    {
        QByteArray byteArray = clientSocket->readAll(); // Read all available bytes
        QString str = QString::fromUtf8(byteArray); // Convert to QString from UTF-8 bytes

        qDebug() << "Received string:" << str;

        emit gotNewMesssage(str);

        if (sendToClient(clientSocket, QString("Reply: received [%1]").arg(str)) == -1)
        {
            qDebug() << "Some error occurred";}}}




void ServerStuff::gotDisconnection()
{
    clients.removeAt(clients.indexOf((QTcpSocket*)sender()));
    emit smbDisconnected();
}


qint64 ServerStuff::sendToClient(QTcpSocket *socket, const QString &str)
{
    QByteArray arrBlock;
    QDataStream out(&arrBlock, QIODevice::WriteOnly);
    //out.setVersion(QDataStream::Qt_5_10);
    //out << quint16(0) << QTime::currentTime() << str;
    out << quint16(0) << str;

    out.device()->seek(0);
    out << quint16(arrBlock.size() - sizeof(quint16));

    return socket->write(arrBlock);
}
