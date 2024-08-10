#include "translation.h"
#include <QtDebug>

Translator::Translator(QObject* parent)
	: QObject(parent) {
	this->m_translator.load("fudy_us.qm", m_App->applicationDirPath());
	this->m_App->installTranslator(&m_translator);
}

void Translator::setLanguage(int lang) {
	switch (lang) {
	case Languages::Vietnamese:
		m_translator.load("fudy_vn.qm", m_App->applicationDirPath());
		break;
	case Languages::English:
		m_translator.load("fudy_us.qm", m_App->applicationDirPath());
		break;
	case Languages::Chinese:
		m_translator.load("fudy_cn.qm", m_App->applicationDirPath());
		break;
	case Languages::Japanese:
		m_translator.load("fudy_ja.qm", m_App->applicationDirPath());
		break;
	default:
		m_translator.load("fudy_us.qm", m_App->applicationDirPath());
		break;
	}
	this->m_App->installTranslator(&m_translator);
	emit languageChanged();
}

QString Translator::language() const {
	return "";
}

int Translator::vi_VN() const {
	return m_vie;
}

int Translator::en_US() const {
	return m_eng;
}

int Translator::zh_CN() const {
	return m_chi;
}

int Translator::ja_JP() const {
	return m_jpn;
}
