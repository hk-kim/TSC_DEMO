package ensof.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

public class Config implements ConfigInterface {
	public static void main(String[] args) {
		new Config();
	}
	
	
	public static final String db_URL = "com.ensof.dburl";
	//public static final String DEFAULT_dbURL = "C:/test/Config.conf";
	public static final String DEFAULT_dbURL = "/home/weblogic/weblogic_20180806/config";
	
	DataLog dataLog = new DataLog();
	private String configFileName;

	public Config() {
		initialize();
	}

	public void initialize() {
		String dbURL = System.getProperty(db_URL, DEFAULT_dbURL);
		
		System.out.println("---------->dbURL : " + dbURL);
		
		File fileName = new File(dbURL);
		this.configFileName = fileName.getAbsolutePath();
		try {
			File configFile = new File(this.configFileName);
			if (!configFile.canRead()) {
				this.dataLog.write_Log(2, "Config ����",
						"������ ���� ���� ����");
			}
			this.props = new Properties();
			FileInputStream fin = new FileInputStream(configFile);
			this.props.load(new BufferedInputStream(fin));
			fin.close();
		} catch (Exception ex) {
			this.dataLog.write_Log(2, "Config ����", "������ ���� ���� ����"
					+ ex.toString());
		}
	}

	protected Properties props = null;

	public Properties getProperties() {
		return this.props;
	}

	public String getString(String key) {
		String value = null;
		try {
			value = this.props.getProperty(key);
		} catch (Exception e) {
			this.dataLog.write_Log(2, "getString", "Illegal string key" + key);
		}
		return value;
	}

	public int getInt(String key) {
		int value = 0;
		try {
			value = Integer.parseInt(this.props.getProperty(key));
		} catch (Exception ex) {
			this.dataLog.write_Log(2, "getInt", "Illegal int key" + key);
		}
		return value;
	}

	public double getDouble(String key) {
		double value = 0.0D;
		try {
			value = Double.valueOf(this.props.getProperty(key)).doubleValue();
		} catch (Exception ex) {
			this.dataLog.write_Log(2, "getDouble", "Illegal double key" + key);
		}
		return value;
	}

	public boolean getBoolean(String key) {
		boolean value = false;
		try {
			value = Boolean.valueOf(this.props.getProperty(key)).booleanValue();
		} catch (Exception ex) {
			this.dataLog
					.write_Log(2, "getBoolean", "Illegal boolean key" + key);
		}
		return value;
	}
}
