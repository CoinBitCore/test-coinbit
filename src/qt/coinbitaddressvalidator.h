// Copyright (c) 2011-2014 The Coinbit Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef COINBIT_QT_COINBITADDRESSVALIDATOR_H
#define COINBIT_QT_COINBITADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class CoinbitAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit CoinbitAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Coinbit address widget validator, checks for a valid coinbit address.
 */
class CoinbitAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit CoinbitAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // COINBIT_QT_COINBITADDRESSVALIDATOR_H
