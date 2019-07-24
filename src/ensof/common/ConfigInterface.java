package ensof.common;

import java.util.Properties;

abstract interface ConfigInterface
{
  public abstract Properties getProperties();
  
  public abstract String getString(String paramString);
  
  public abstract int getInt(String paramString);
  
  public abstract double getDouble(String paramString);
  
  public abstract boolean getBoolean(String paramString);
}
