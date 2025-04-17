#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include "clientStuff.h"
#include "serverStuff.h"

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool currentStatus READ getStatus NOTIFY statusChanged)

public:
    explicit Backend(QObject *parent = nullptr);
    bool getStatus();

signals:
    void statusChanged(QString newStatus);
    void someError(QString err);
    void someMessage(QString msg);
    void smbConnected();
    void smbDisconnected();
    void newMessage(QString msg);

public slots:
    void setStatus(bool newStatus);
    void receivedSomething(QString msg);
    void gotError(QAbstractSocket::SocketError err);
    void sendClicked(QString msg);
    void sendclicked2(quint8 msg);
    //void sendClicked3(QString msg);
    void connectClicked();
    void disconnectClicked();
    QString stopClicked();
    QString startClicked();
    QString testClicked();
    void smbConnectedToServer();
    void smbDisconnectedFromServer();
    void gotNewMesssage(QString msg);
    //void setClientIp(const QString &ip, int port);


private:
    ServerStuff *server;
    ClientStuff *client;
};

#endif // BACKEND_H
