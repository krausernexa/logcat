.class public Lcom/android/tools/fd/runtime/BootstrapApplication;
.super Landroid/app/Application;
.source "BootstrapApplication.java"


# static fields
.field public static final LOG_TAG:Ljava/lang/String; = "InstantRun"


# instance fields
.field private externalResourcePath:Ljava/lang/String;

.field private realApplication:Landroid/app/Application;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 68
    new-instance v0, Lcom/android/tools/fd/runtime/BootstrapApplication$1;

    invoke-direct {v0}, Lcom/android/tools/fd/runtime/BootstrapApplication$1;-><init>()V

    sput-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    .line 110
    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .prologue
    const/4 v2, 0x2

    .line 115
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 116
    const-string/jumbo v0, "InstantRun"

    invoke-static {v0, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 117
    const-string/jumbo v0, "InstantRun"

    const-string/jumbo v1, "BootstrapApplication created. Android package is %s, real application class is %s."

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    sget-object v4, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    sget-object v4, Lcom/android/tools/fd/runtime/AppInfo;->applicationClass:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :cond_0
    return-void
.end method

.method private createRealApplication()V
    .locals 6

    .prologue
    const/4 v4, 0x2

    .line 197
    sget-object v3, Lcom/android/tools/fd/runtime/AppInfo;->applicationClass:Ljava/lang/String;

    if-eqz v3, :cond_3

    .line 198
    const-string/jumbo v3, "InstantRun"

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 199
    const-string/jumbo v3, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "About to create real application of class name = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/android/tools/fd/runtime/AppInfo;->applicationClass:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    :cond_0
    :try_start_0
    sget-object v3, Lcom/android/tools/fd/runtime/AppInfo;->applicationClass:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 207
    .local v2, "realClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Application;>;"
    const-string/jumbo v3, "InstantRun"

    const/4 v4, 0x2

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 208
    const-string/jumbo v3, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Created delegate app class successfully : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " with class loader "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    :cond_1
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 212
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Landroid/app/Application;>;"
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Application;

    iput-object v3, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->realApplication:Landroid/app/Application;

    .line 213
    const-string/jumbo v3, "InstantRun"

    const/4 v4, 0x2

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 214
    const-string/jumbo v3, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Created real app instance successfully :"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->realApplication:Landroid/app/Application;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Landroid/app/Application;>;"
    .end local v2    # "realClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Application;>;"
    :cond_2
    :goto_0
    return-void

    .line 216
    :catch_0
    move-exception v1

    .line 217
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 220
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    new-instance v3, Landroid/app/Application;

    invoke-direct {v3}, Landroid/app/Application;-><init>()V

    iput-object v3, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->realApplication:Landroid/app/Application;

    goto :goto_0
.end method

.method private createResources(J)V
    .locals 7
    .param p1, "apkModified"    # J

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x2

    .line 125
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->checkInbox()V

    .line 127
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getExternalResourceFile()Ljava/io/File;

    move-result-object v0

    .line 128
    .local v0, "file":Ljava/io/File;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    :cond_0
    iput-object v4, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->externalResourcePath:Ljava/lang/String;

    .line 130
    const-string/jumbo v4, "InstantRun"

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 131
    const-string/jumbo v4, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Resource override is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->externalResourcePath:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    :cond_1
    if-eqz v0, :cond_5

    .line 136
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    .line 137
    .local v2, "resourceModified":J
    const-string/jumbo v4, "InstantRun"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 138
    const-string/jumbo v4, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Resource patch last modified: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    const-string/jumbo v5, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "APK last modified: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    cmp-long v4, p1, v2

    if-lez v4, :cond_6

    const-string/jumbo v4, ">"

    :goto_0
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, " resource patch"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    :cond_2
    const-wide/16 v4, 0x0

    cmp-long v4, p1, v4

    if-eqz v4, :cond_3

    cmp-long v4, v2, p1

    if-gtz v4, :cond_5

    .line 144
    :cond_3
    const-string/jumbo v4, "InstantRun"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 145
    const-string/jumbo v4, "InstantRun"

    const-string/jumbo v5, "Ignoring resource file, older than APK"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    :cond_4
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->externalResourcePath:Ljava/lang/String;

    .line 153
    .end local v2    # "resourceModified":J
    :cond_5
    :goto_1
    return-void

    .line 139
    .restart local v2    # "resourceModified":J
    :cond_6
    const-string/jumbo v4, "<"
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 149
    .end local v2    # "resourceModified":J
    :catch_0
    move-exception v1

    .line 150
    .local v1, "t":Ljava/lang/Throwable;
    const-string/jumbo v4, "InstantRun"

    const-string/jumbo v5, "Failed to check patch timestamps"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public static join(CLjava/util/List;)Ljava/lang/String;
    .locals 4
    .param p0, "on"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 188
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .local v2, "stringBuilder":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 190
    .local v1, "item":Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 192
    .end local v1    # "item":Ljava/lang/String;
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 193
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static setupClassLoaders(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "codeCacheDir"    # Ljava/lang/String;
    .param p2, "apkModified"    # J

    .prologue
    const/4 v7, 0x2

    .line 156
    invoke-static {p0, p2, p3}, Lcom/android/tools/fd/runtime/FileManager;->getDexList(Landroid/content/Context;J)Ljava/util/List;

    move-result-object v1

    .line 159
    .local v1, "dexList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-class v4, Lcom/android/tools/fd/runtime/Server;

    .line 160
    .local v4, "server":Ljava/lang/Class;, "Ljava/lang/Class<Lcom/android/tools/fd/runtime/Server;>;"
    const-class v3, Lcom/android/tools/fd/runtime/MonkeyPatcher;

    .line 162
    .local v3, "patcher":Ljava/lang/Class;, "Ljava/lang/Class<Lcom/android/tools/fd/runtime/MonkeyPatcher;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 163
    const-string/jumbo v6, "InstantRun"

    invoke-static {v6, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 164
    const-string/jumbo v6, "InstantRun"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Bootstrapping class loader with dex list "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0xa

    invoke-static {v8, v1}, Lcom/android/tools/fd/runtime/BootstrapApplication;->join(CLjava/util/List;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    :cond_0
    const-class v6, Lcom/android/tools/fd/runtime/BootstrapApplication;

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 170
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string/jumbo v7, "getLdLibraryPath"

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Class;

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v6, v0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 172
    .local v2, "nativeLibraryPath":Ljava/lang/String;
    const-string/jumbo v6, "InstantRun"

    const/4 v7, 0x2

    invoke-static {v6, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 173
    const-string/jumbo v6, "InstantRun"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Native library path: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    :cond_1
    :goto_0
    invoke-static {v0, v2, p1, v1}, Lcom/android/tools/fd/runtime/IncrementalClassLoader;->inject(Ljava/lang/ClassLoader;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/lang/ClassLoader;

    .line 185
    .end local v0    # "classLoader":Ljava/lang/ClassLoader;
    .end local v2    # "nativeLibraryPath":Ljava/lang/String;
    :cond_2
    return-void

    .line 175
    .restart local v0    # "classLoader":Ljava/lang/ClassLoader;
    :catch_0
    move-exception v5

    .line 176
    .local v5, "t":Ljava/lang/Throwable;
    const-string/jumbo v6, "InstantRun"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Failed to determine native library path "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getNativeLibraryFolder()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "nativeLibraryPath":Ljava/lang/String;
    goto :goto_0
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 229
    sget-boolean v5, Lcom/android/tools/fd/runtime/AppInfo;->usingApkSplits:Z

    if-nez v5, :cond_0

    .line 230
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    iget-object v0, v5, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 231
    .local v0, "apkFile":Ljava/lang/String;
    if-eqz v0, :cond_2

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    .line 232
    .local v2, "apkModified":J
    :goto_0
    invoke-direct {p0, v2, v3}, Lcom/android/tools/fd/runtime/BootstrapApplication;->createResources(J)V

    .line 233
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-static {p1, v5, v2, v3}, Lcom/android/tools/fd/runtime/BootstrapApplication;->setupClassLoaders(Landroid/content/Context;Ljava/lang/String;J)V

    .line 236
    .end local v0    # "apkFile":Ljava/lang/String;
    .end local v2    # "apkModified":J
    :cond_0
    invoke-direct {p0}, Lcom/android/tools/fd/runtime/BootstrapApplication;->createRealApplication()V

    .line 241
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 243
    iget-object v5, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->realApplication:Landroid/app/Application;

    if-eqz v5, :cond_1

    .line 245
    :try_start_0
    const-class v5, Landroid/content/ContextWrapper;

    const-string/jumbo v6, "attachBaseContext"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Landroid/content/Context;

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 247
    .local v1, "attachBaseContext":Ljava/lang/reflect/Method;
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 248
    iget-object v5, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->realApplication:Landroid/app/Application;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-virtual {v1, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .end local v1    # "attachBaseContext":Ljava/lang/reflect/Method;
    :cond_1
    return-void

    .line 231
    .restart local v0    # "apkFile":Ljava/lang/String;
    :cond_2
    const-wide/16 v2, 0x0

    goto :goto_0

    .line 249
    .end local v0    # "apkFile":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 250
    .local v4, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method public onCreate()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x2

    .line 260
    sget-boolean v8, Lcom/android/tools/fd/runtime/AppInfo;->usingApkSplits:Z

    if-nez v8, :cond_5

    .line 261
    iget-object v8, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->realApplication:Landroid/app/Application;

    iget-object v9, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->externalResourcePath:Ljava/lang/String;

    invoke-static {p0, p0, v8, v9}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->monkeyPatchApplication(Landroid/content/Context;Landroid/app/Application;Landroid/app/Application;Ljava/lang/String;)V

    .line 264
    iget-object v8, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->externalResourcePath:Ljava/lang/String;

    invoke-static {p0, v8, v11}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->monkeyPatchExistingResources(Landroid/content/Context;Ljava/lang/String;Ljava/util/Collection;)V

    .line 273
    :goto_0
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 277
    sget-object v8, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    if-eqz v8, :cond_3

    .line 279
    const/4 v0, 0x0

    .line 280
    .local v0, "foundPackage":Z
    :try_start_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    .line 281
    .local v3, "pid":I
    const-string/jumbo v8, "activity"

    invoke-virtual {p0, v8}, Lcom/android/tools/fd/runtime/BootstrapApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager;

    .line 283
    .local v2, "manager":Landroid/app/ActivityManager;
    invoke-virtual {v2}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v5

    .line 286
    .local v5, "processes":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    if-eqz v5, :cond_6

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x1

    if-le v8, v9, :cond_6

    .line 289
    const/4 v6, 0x0

    .line 290
    .local v6, "startServer":Z
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 291
    .local v4, "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    sget-object v8, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    iget-object v9, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 292
    const/4 v0, 0x1

    .line 293
    iget v8, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v8, v3, :cond_0

    .line 294
    const/4 v6, 0x1

    .line 299
    .end local v4    # "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_1
    if-nez v6, :cond_2

    if-nez v0, :cond_2

    .line 303
    const/4 v6, 0x1

    .line 304
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 305
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "Multiprocess but didn\'t find process with package: starting server anyway"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    if-eqz v6, :cond_3

    .line 315
    sget-object v8, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    invoke-static {v8, p0}, Lcom/android/tools/fd/runtime/Server;->create(Ljava/lang/String;Landroid/app/Application;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 325
    .end local v0    # "foundPackage":Z
    .end local v2    # "manager":Landroid/app/ActivityManager;
    .end local v3    # "pid":I
    .end local v5    # "processes":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    .end local v6    # "startServer":Z
    :cond_3
    :goto_2
    iget-object v8, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->realApplication:Landroid/app/Application;

    if-eqz v8, :cond_4

    .line 326
    iget-object v8, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->realApplication:Landroid/app/Application;

    invoke-virtual {v8}, Landroid/app/Application;->onCreate()V

    .line 328
    :cond_4
    return-void

    .line 269
    :cond_5
    iget-object v8, p0, Lcom/android/tools/fd/runtime/BootstrapApplication;->realApplication:Landroid/app/Application;

    invoke-static {p0, p0, v8, v11}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->monkeyPatchApplication(Landroid/content/Context;Landroid/app/Application;Landroid/app/Application;Ljava/lang/String;)V

    goto :goto_0

    .line 311
    .restart local v0    # "foundPackage":Z
    .restart local v2    # "manager":Landroid/app/ActivityManager;
    .restart local v3    # "pid":I
    .restart local v5    # "processes":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    :cond_6
    const/4 v6, 0x1

    .restart local v6    # "startServer":Z
    goto :goto_1

    .line 317
    .end local v2    # "manager":Landroid/app/ActivityManager;
    .end local v3    # "pid":I
    .end local v5    # "processes":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    .end local v6    # "startServer":Z
    :catch_0
    move-exception v7

    .line 318
    .local v7, "t":Ljava/lang/Throwable;
    const-string/jumbo v8, "InstantRun"

    invoke-static {v8, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 319
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "Failed during multi process check"

    invoke-static {v8, v9, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 321
    :cond_7
    sget-object v8, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    invoke-static {v8, p0}, Lcom/android/tools/fd/runtime/Server;->create(Ljava/lang/String;Landroid/app/Application;)V

    goto :goto_2
.end method
