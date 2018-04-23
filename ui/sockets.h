#ifndef SOCKETS_H
#define SOCKETS_H

#include <QObject>
#include <QThread>

class sockets: public QThread {
    Q_OBJECT
    public:
        explicit sockets (QThread* parent = 0);
        Q_INVOKABLE void sendStr();
        ~sockets();

    signals:
        void socket_str();

};

#endif // SOCKETS_H
